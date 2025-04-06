(() => {
    // Use modern querySelector with caching for better performance
    const cache = new Map();

    const x = (p) => {
        if (cache.has(p)) return cache.get(p);
        const result = document.evaluate(
            p,
            document,
            null,
            XPathResult.FIRST_ORDERED_NODE_TYPE,
            null
        ).singleNodeValue;
        cache.set(p, result);
        return result;
    };

    // Use more efficient event dispatching
    const f = (e, events = ["focus", "mousedown", "input"]) => {
        if (!e) return;
        const opts = { bubbles: true, cancelable: true };
        events.forEach((type) => e.dispatchEvent(new Event(type, opts)));
    };

    // Perform operations synchronously without waiting
    const c = (e) => e?.click();

    // Try data options and input field immediately
    const dataOpt = x("/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div");
    const input = x("//*[contains(@id, '-input')][starts-with(@id, 'react-select-')]");

    dataOpt && c(dataOpt);
    input && f(input);

    // Try to interact with the option immediately
    const option = x("//*[contains(@id, '-option-0')][starts-with(@id, 'react-select-')]");
    if (option) {
        f(option, ["mouseenter", "mousedown"]);
        c(option);
    }

    // Always try to download immediately
    const btn = x("/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button");
    btn && c(btn);
})();

