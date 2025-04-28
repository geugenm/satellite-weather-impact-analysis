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

    const expand_data = await wait_for('[aria-label="Expand query row"]');

    const panel = await wait_for(
        'div[aria-label="Panel inspector Data content"]',
    );
    function sleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }
    await sleep(50);

    const input = panel?.querySelector(
        '[class*="grafana-select-value-container"] input',
    );

    input?.focus({ preventScroll: true });
    ["mousedown", "focusin"].forEach((evt) =>
        input?.dispatchEvent(
            new (evt.startsWith("focus") ? FocusEvent : MouseEvent)(evt, {
                bubbles: true,
            }),
        ),
    );

    await sleep(50);

    const option = Array.from(
        document.querySelectorAll(
            '[role="option"], [id^="react-select-"][id$="-option-"]',
        ),
    ).find((el) =>
        el.textContent?.toLowerCase().includes("series joined by time"),
    );

    option?.click();

    const downloadBtn = Array.from(panel.querySelectorAll("button")).find(
        (btn) => btn.textContent.includes("Download CSV"),
    );
    if (!downloadBtn)
        throw new Error("'Download CSV' was not found, nothing to download");

    downloadBtn.click();
})();
