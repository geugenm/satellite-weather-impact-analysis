(async () => {
    function wait_for(selector, parent = document) {
        return Promise.race([
            new Promise((resolve) => {
                if (parent.querySelector(selector))
                    return resolve(parent.querySelector(selector));

                const observer = new MutationObserver(() => {
                    const element = parent.querySelector(selector);
                    if (element) {
                        observer.disconnect();
                        resolve(element);
                    }
                });

                observer.observe(parent === document ? document.body : parent, {
                    childList: true,
                    subtree: true,
                });
            }),
            new Promise((_, reject) =>
                setTimeout(
                    () =>
                        reject(new Error(`Timeout waiting for "${selector}"`)),
                    wait_for.timeout || 10000,
                ),
            ),
        ]);
    }

    const container = wait_for(
        '[data-testid="data-testid browse-dashboards-table"] div[style*="overflow: auto"]',
    );
    if (!container) throw new Error("scroll_container_not_found");

    const base_url = "https://dashboard.satnogs.org";
    const urls = new Set();

    function extract_urls() {
        document
            .querySelectorAll('[role="row"] a[href^="/d/"]')
            .forEach((a) => urls.add(base_url + a.getAttribute("href")));
        return urls.size;
    }

    extract_urls();

    async function scan_with_end_verification() {
        // Primary parallel scan
        const scroll_jobs = [];

        // Job 1: Fast scan with large jumps
        scroll_jobs.push(
            (async () => {
                for (
                    let pos = 0;
                    pos < container.scrollHeight * 1.1;
                    pos += container.clientHeight * 0.7
                ) {
                    container.scrollTop = pos;
                    await new Promise((r) => setTimeout(r, 100));
                    extract_urls();
                }
            })(),
        );

        // Job 2: Thorough scan with smaller steps
        scroll_jobs.push(
            (async () => {
                const row_height = 36;
                const step_size = row_height * 5;
                const start_offset = container.clientHeight * 0.3;

                for (
                    let pos = start_offset;
                    pos < container.scrollHeight * 1.1;
                    pos += step_size
                ) {
                    container.scrollTop = pos;
                    await new Promise((r) => setTimeout(r, 150));
                    extract_urls();
                }
            })(),
        );

        // Wait for parallel scans to complete
        await Promise.all(scroll_jobs);

        // Critical end handling - specifically for the missing items
        const max_scroll = container.scrollHeight - container.clientHeight;

        // First: absolute end
        container.scrollTop = max_scroll;
        await new Promise((r) => setTimeout(r, 300));
        extract_urls();

        // Second: scroll back then forward again (crucial for virtual lists)
        container.scrollTop = max_scroll - 200;
        await new Promise((r) => setTimeout(r, 150));
        extract_urls();

        container.scrollTop = Number.MAX_SAFE_INTEGER; // Force maximum scroll
        await new Promise((r) => setTimeout(r, 200));
        extract_urls();

        // Final verification with jitter at the end
        for (let i = 10; i >= 0; i--) {
            container.scrollTop = max_scroll - i * 20;
            await new Promise((r) => setTimeout(r, 50));
            extract_urls();
        }
    }

    await scan_with_end_verification();

    return Array.from(urls);
})();
