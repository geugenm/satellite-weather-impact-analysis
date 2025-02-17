(() => {
    const x = (p) =>
            document.evaluate(p, document, null, 9, null).singleNodeValue,
        w = (p, t = 100) =>
            new Promise((r) => {
                const s = performance.now(),
                    i = setInterval(() => {
                        const e = x(p);
                        e
                            ? (clearInterval(i), r(e))
                            : performance.now() - s > t &&
                              (clearInterval(i), r(null));
                    }, 5);
            }),
        f = (e, v = ["focus", "mousedown", "input"]) =>
            e &&
            v.forEach((t) => e.dispatchEvent(new Event(t, { bubbles: true })));

    (async () => {
        const c = (e) => e?.click();

        // Try data options, but continue if not found
        const dataOpt = await w(
            "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div",
        );
        dataOpt && c(dataOpt);

        // Try input field, but continue if not found
        const input = await w(
            "//*[contains(@id, '-input')][starts-with(@id, 'react-select-')]",
        );
        input && f(input);

        // Try first option, but continue if not found
        const option = await w(
            "//*[contains(@id, '-option-0')][starts-with(@id, 'react-select-')]",
        );
        option && (f(option), c(option));

        // Always try to download
        const btn = await w(
            "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button",
        );
        btn && c(btn);
    })();
})();
