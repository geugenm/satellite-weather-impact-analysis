async function wait_for_element(xpath) {
    return new Promise((resolve, reject) => {
        const interval = setInterval(() => {
            const element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            if (element) {
                clearInterval(interval);
                resolve(element);
            }
        }, 1);

        setTimeout(() => {
            clearInterval(interval);
            reject(new Error(`Element '${xpath}' not found: timeout`));
        }, 100);
    });
}

function click_element_by_xpath(xpath) {
    const element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    if (element) {
        element.click();
    } else {
        console.error(`Failed to click on element '${xpath}': no such element`);
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
        console.error(`Failed to dispatch events on '${element}': no such element`);
    }
}

async function main() {
    const data_options_xpath = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div";

    try {
        await wait_for_element(data_options_xpath);
        click_element_by_xpath(data_options_xpath);
    } catch (error) {
        console.error(`Error processing data options: ${error.message}`);
    }

    const input_xpath = '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-input") + 1) = "-input"]';

    try {
        const input_element = await wait_for_element(input_xpath);
        dispatch_events(input_element);
    } catch (error) {
        console.error(`Error processing input element: ${error.message}`);
    }

    const option_xpath = '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-option-0") + 1) = "-option-0"]';

    try {
        const option_element = await wait_for_element(option_xpath);
        dispatch_events(option_element);
        option_element?.click();
    } catch (error) {
        console.error(`Error processing option element: ${error.message}`);
    }

    const download_button_xpath = "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button";

    try {
        await wait_for_element(download_button_xpath);
        click_element_by_xpath(download_button_xpath);
    } catch (error) {
        console.error(`Error processing download button: ${error.message}`);
    }
}

main().catch(error => console.error(`Main function error: ${error.message}`));