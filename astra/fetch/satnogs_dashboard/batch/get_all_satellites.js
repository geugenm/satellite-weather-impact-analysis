function extractDashboardLinks() {
    // Get all anchor elements in the document
    const allAnchors = document.querySelectorAll("a");
    const dashboardLinks = [];

    // Regular expression to match dashboard links like /d/QGujdBBZk/aausat4
    const dashboardLinkRegex = /\/d\/[A-Za-z0-9]+\/[\w-]+/;

    // Check each anchor
    allAnchors.forEach((anchor) => {
        // Check if it has the specific class or is within a search section
        const isInSearchSection = anchor.closest(
            'div[aria-label="Search section"]',
        );
        const hasTargetClass = anchor.classList.contains("css-1tqmn3d");

        if ((isInSearchSection || hasTargetClass) && anchor.href) {
            const match = anchor.href.match(dashboardLinkRegex);
            if (match) {
                const fullUrl = `https://dashboard.satnogs.org${match[0]}`;
                dashboardLinks.push(fullUrl);
            }
        }
    });

    return dashboardLinks;
}

const links = extractDashboardLinks();
console.log(`Found ${links.length} dashboard links:`);
links.forEach((link) => console.log(link));
