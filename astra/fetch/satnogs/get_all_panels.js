() => {
    const uniquePanels = new Map();

    [
        ...document.querySelectorAll(
            "[data-viz-panel-key], [data-griditem-key]",
        ),
    ].forEach((el) => {
        const panelKey =
            el.getAttribute("data-viz-panel-key") ||
            el
                .closest("[data-griditem-key]")
                ?.getAttribute("data-griditem-key");

        const id = parseInt(panelKey.replace(/^(panel|grid-item)-/, ""));

        const title =
            el.querySelector("h2[title], .panel-title-text")?.innerText ||
            el.querySelector('h2[class*="css-"]')?.innerText ||
            "Untitled Panel";

        const type = el.querySelector(".dashboard-row") ? "row" : "panel";

        uniquePanels.set(id, { id, title, type });
    });

    return [...uniquePanels.values()].sort((a, b) => a.id - b.id);
};
