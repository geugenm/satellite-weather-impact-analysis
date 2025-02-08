() => {
    const panels = [];

    // Process all grid items
    document
        .querySelectorAll('div.react-grid-item[id^="panel-"]')
        .forEach((panel) => {
            // Check if it's a real panel or just a row header
            const isCollapsedRow = panel.querySelector(
                ".dashboard-row--collapsed",
            );
            const isExpandedRow = panel.querySelector(
                ".dashboard-row:not(.dashboard-row--collapsed)",
            );

            if (!isCollapsedRow && !isExpandedRow) {
                // Regular panel
                panels.push({
                    id: parseInt(panel.id.replace("panel-", "")),
                    title:
                        panel.querySelector(".panel-title-text")?.innerText ||
                        "Untitled Panel",
                    type: "panel",
                });
            } else if (isExpandedRow) {
                // Row header (expanded)
                const title = panel.querySelector(
                    ".dashboard-row__title",
                )?.innerText;
                if (title) {
                    panels.push({
                        id: parseInt(panel.id.replace("panel-", "")),
                        title: title,
                        type: "row",
                    });
                }
            }
        });

    return panels
        .filter((panel) => !isNaN(panel.id))
        .sort((a, b) => a.id - b.id);
};
