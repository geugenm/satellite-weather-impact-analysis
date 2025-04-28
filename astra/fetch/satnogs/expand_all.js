(() => {
    const fast_scroll = () => {
        const totalHeight = Math.max(
            document.body.scrollHeight,
            document.documentElement.scrollHeight,
        );

        let currentPosition = window.scrollY;
        const step = Math.max(5000, Math.floor(totalHeight / 100)); // Adjust speed here

        const scroll = () => {
            currentPosition = Math.min(currentPosition + step, totalHeight);
            window.scrollTo(0, currentPosition);

            if (currentPosition < totalHeight) {
                requestAnimationFrame(scroll);
            }
        };

        requestAnimationFrame(scroll);
    };

    fast_scroll();

    const expandButtons = [
        ...document.querySelectorAll('button[aria-label="Expand row"]'),
    ];

    expandButtons.forEach((button) => button.click());

    return expandButtons.length;
})();
