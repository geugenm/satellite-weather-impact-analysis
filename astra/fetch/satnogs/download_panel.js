(() => {
    document.querySelector('[aria-label="Expand query row"]')?.click();

    const panel = document.querySelector(
        'div[aria-label="Panel inspector Data content"]',
    );
    const input = panel.querySelector(
        '[class*="grafana-select-value-container"] input',
    );

    if (input) {
        input.focus({ preventScroll: true });
        ["mousedown", "focusin"].forEach((evt) =>
            input.dispatchEvent(
                new (evt.startsWith("focus") ? FocusEvent : MouseEvent)(evt, {
                    bubbles: true,
                }),
            ),
        );

        const option = Array.from(
            document.querySelectorAll(
                '[role="option"], [id^="react-select-"][id$="-option-"]',
            ),
        ).find((el) =>
            el.textContent?.toLowerCase().includes("series joined by time"),
        );

        ["mousedown", "mouseup", "click"].forEach((evt) =>
            option.dispatchEvent(new MouseEvent(evt, { bubbles: true })),
        );
    }

    const downloadBtn = Array.from(panel.querySelectorAll("button")).find(
        (btn) => btn.textContent.includes("Download CSV"),
    );
    downloadBtn.click();
})();
