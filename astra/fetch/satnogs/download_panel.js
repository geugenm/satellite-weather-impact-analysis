(() => {
    // Use modern querySelector with caching for better performance
    const cache = new Map();

    const x = (p) => {
        if (cache.has(p)) return cache.get(p);
        const result = document.evaluate(
            p,
            document,
            null,
            9,
            null,
        ).singleNodeValue;
        cache.set(p, result);
        return result;
    };

    // Use requestAnimationFrame for smoother timing and less CPU usage
    const w = (p, t = 100) => {
        return new Promise((resolve) => {
            const startTime = performance.now();

            const check = () => {
                const element = x(p);
                if (element) {
                    resolve(element);
                    return;
                }

                if (performance.now() - startTime > t) {
                    resolve(null);
                    return;
                }

                requestAnimationFrame(check);
            };

            requestAnimationFrame(check);
        });
    };

    // Use more efficient event dispatching
    const f = (e, events = ["focus", "mousedown", "input"]) => {
        if (!e) return;
        const opts = { bubbles: true, cancelable: true };
        events.forEach((type) => e.dispatchEvent(new Event(type, opts)));
    };

    // Use Promise.all for parallel operations where possible
    (async () => {
        const c = (e) => e?.click();

        // Try data options and input field in parallel
        const [dataOpt, input] = await Promise.all([
            w(
                "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div",
                50,
            ),
            w(
                "//*[contains(@id, '-input')][starts-with(@id, 'react-select-')]",
                50,
            ),
        ]);

        dataOpt && c(dataOpt);
        input && f(input);

        // Wait for option to appear after input interaction
        const option = await w(
            "//*[contains(@id, '-option-0')][starts-with(@id, 'react-select-')]",
            50,
        );
        if (option) {
            f(option, ["mouseenter", "mousedown"]);
            c(option);
        }

        // Always try to download
        const btn = await w(
            "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button",
            50,
        );
        btn && c(btn);
    })();
})();
