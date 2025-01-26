async function waitForElement(xpath, timeout = 100) {
    return new Promise((resolve, reject) => {
        const startTime = performance.now();
        const interval = setInterval(() => {
            const element = document.evaluate(
                xpath,
                document,
                null,
                XPathResult.FIRST_ORDERED_NODE_TYPE,
                null,
            ).singleNodeValue;

            if (element) {
                clearInterval(interval);
                resolve(element);
            } else if (performance.now() - startTime > timeout) {
                clearInterval(interval);
                reject(
                    new Error(
                        `Element '${xpath}' not found within timeout of ${timeout}ms.`,
                    ),
                );
            }
        }, 5);
    });
}

function getElementByXPath(xpath) {
    return document.evaluate(
        xpath,
        document,
        null,
        XPathResult.FIRST_ORDERED_NODE_TYPE,
        null,
    ).singleNodeValue;
}

function safeClick(element) {
    if (element) {
        element.click();
    } else {
        console.error("Failed to click element: no such element.");
    }
}

function dispatchEvents(element, events = ["focus", "mousedown", "input"]) {
    if (element) {
        events.forEach((eventType) => {
            const event = new Event(eventType, {
                bubbles: true,
                cancelable: true,
            });
            element.dispatchEvent(event);
        });
    } else {
        console.error("Failed to dispatch events: no such element.");
    }
}

async function processElement(xpath, action, timeout = 100) {
    try {
        const element = await waitForElement(xpath, timeout);
        action(element);
    } catch (error) {
        console.error(`Error processing element '${xpath}': ${error.message}`);
    }
}

async function main() {
    const xpaths = {
        dataOptions:
            "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div",
        inputField:
            '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-input") + 1) = "-input"]',
        firstOption:
            '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-option-0") + 1) = "-option-0"]',
        downloadButton:
            "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button",
    };

    await processElement(xpaths.dataOptions, safeClick);

    await processElement(xpaths.inputField, (element) => {
        dispatchEvents(element);
    });

    await processElement(xpaths.firstOption, (element) => {
        dispatchEvents(element);
        element?.click();
    });

    await processElement(xpaths.downloadButton, safeClick);
}

main().catch((error) =>
    console.error(`Unhandled error in main: ${error.message}`),
);
