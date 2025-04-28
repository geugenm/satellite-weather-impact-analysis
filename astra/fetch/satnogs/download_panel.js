(async () => {
    function wait_for(selector, parent = document) {
        return new Promise((resolve) => {
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
        });
    }

    const expand_data = await wait_for('[aria-label="Expand query row"]');
    expand_data.click();
    const panel = await wait_for(
        'div[aria-label="Panel inspector Data content"]',
    );

    const input = await wait_for(
        '[class*="grafana-select-value-container"] input',
        panel,
    );

    input.focus({ preventScroll: true });
    ["mousedown", "focusin"].forEach((evt) =>
        input.dispatchEvent(
            new (evt.startsWith("focus") ? FocusEvent : MouseEvent)(evt, {
                bubbles: true,
            }),
        ),
    );

    function sleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }
    await sleep(20);

    const option = Array.from(
        document.querySelectorAll(
            '[role="option"], [id^="react-select-"][id$="-option-"]',
        ),
    ).find((el) =>
        el.textContent?.toLowerCase().includes("series joined by time"),
    );

    option.click();

    const downloadBtn = Array.from(panel.querySelectorAll("button")).find(
        (btn) => btn.textContent.includes("Download CSV"),
    );
    downloadBtn.click();
})();
