async function wait_for_element(xpath) {
    return new Promise((resolve, reject) => {
        const interval = setInterval(() => {
            const element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            if (element) {
                clearInterval(interval);
                resolve(element);
            }
        }, 10); // Check every 10 milliseconds

        setTimeout(() => {
            clearInterval(interval);
            reject(new Error(`element '${xpath}' not found: timeout`));
        }, 10000); // 10 seconds timeout
    });
}

function click_element_by_xpath(xpath) {
    const element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    if (element) {
        element.click();
    } else {
        console.error(`failed to click on element '${xpath}': no such element`);
    }
}

function dispatch_events(element) {
    if (element) {
        const events = ['focus', 'mousedown', 'input'];
        events.forEach(event_type => {
            const event = new Event(event_type, { bubbles: true, cancelable: true });
            element.dispatchEvent(event);
        });
    } else {
        console.error(`failed to dispatch events on '${element}': no such element`);
    }
}

async function main() {
    const data_options_xpath = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div";
    await wait_for_element(data_options_xpath).then(() => click_element_by_xpath(data_options_xpath));

    const input_xpath = '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-input") + 1) = "-input"]';
    const input_element = await wait_for_element(input_xpath);
    dispatch_events(input_element);

    const option_xpath = '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-option-0") + 1) = "-option-0"]';
    const option_element = await wait_for_element(option_xpath);
    dispatch_events(option_element);
    option_element?.click();

    const download_button_xpath = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button";
    await wait_for_element(download_button_xpath).then(() => click_element_by_xpath(download_button_xpath));
}

main().catch(error => console.error(error.message));
