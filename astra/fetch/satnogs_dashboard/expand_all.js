(() => {
    return (async () => {
        const collapsedRows = Array.from(
            document.querySelectorAll(".dashboard-row--collapsed"),
        );

        for (const row of collapsedRows) {
            const expandButton = row.querySelector("a.dashboard-row__title");
            if (expandButton) {
                expandButton.click();
                await new Promise((r) => setTimeout(r, 300));
            }
        }
        return collapsedRows.length;
    })();
})();
