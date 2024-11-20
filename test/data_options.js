const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function demoSleep() {
    await sleep(10);
}


function clickElementByXPath(xpath) {
    var element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

    if (element) {
        element.click();
    } else {
        console.error("Element not found for XPath: " + xpath);
    }
}

var data_options_xpath = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div";
clickElementByXPath(data_options_xpath);

demoSleep();

var xpath = '//*[@id="react-select-3-input"]';
// Select the input element using its ID or any other selector
var element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

if (element) {
    var focusEvent = new FocusEvent('focus', {
        bubbles: true,
        cancelable: true,
    });

    var mouseDownEvent = new MouseEvent('mousedown', {
        bubbles: true,
        cancelable: true,
        view: window
    });

    element.dispatchEvent(focusEvent);
    element.dispatchEvent(mouseDownEvent);

    var inputEvent = new Event('input', {
        bubbles: true,
        cancelable: true
    });

    element.dispatchEvent(inputEvent);

    console.log("Triggered events on the input element successfully.");
} else {
    console.error("Element not found.");
}

demoSleep();

var xpath2 = '//*[@id="react-select-3-option-0"]';
// Select the input element using its ID or any other selector
var element2 = document.evaluate(xpath2, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

if (element2) {
    var focusEvent = new FocusEvent('focus', {
        bubbles: true,
        cancelable: true,
    });

    var mouseDownEvent = new MouseEvent('mousedown', {
        bubbles: true,
        cancelable: true,
        view: window
    });

    element2.dispatchEvent(focusEvent);
    element2.dispatchEvent(mouseDownEvent);

    var inputEvent = new Event('input', {
        bubbles: true,
        cancelable: true
    });

    element2.dispatchEvent(inputEvent);

    element2.click()

    console.log("Triggered events on the input element successfully.");
} else {
    console.error("Element not found.");
}

demoSleep();

var download_button_path = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button";
clickElementByXPath(download_button_path);
