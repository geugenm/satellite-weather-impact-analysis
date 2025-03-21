(() => {
    return (async () => {
        const collapsedRows = document.querySelectorAll(
            ".dashboard-row--collapsed",
        );
        const count = collapsedRows.length;

        if (count === 0) return 0;

        // Use requestAnimationFrame for better performance
        const wait = (ms) =>
            new Promise((resolve) => {
                requestAnimationFrame(() => {
                    setTimeout(resolve, ms);
                });
            });

        // Process in batches for better UI responsiveness
        const batchSize = 3;
        for (let i = 0; i < count; i += batchSize) {
            const batch = Array.from(collapsedRows).slice(i, i + batchSize);

            // Click all buttons in current batch
            batch.forEach((row) => {
                const expandButton = row.querySelector(
                    "a.dashboard-row__title",
                );
                expandButton?.click();
            });

            // Wait a shorter time between batches
            await wait(150);
        }

        return count;
    })();
})();
