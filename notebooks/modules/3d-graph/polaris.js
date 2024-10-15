// ---- Global constants
const graph_elt = document.getElementById("3d-graph");
const hud_elt = document.getElementById("graph-hud");
const nodeslist_elt = document.getElementById("nodeslist");
const search_elt = document.getElementById("graph-search-input");
const toast_elt = document.getElementById("toast");
const modal_elt = document.getElementById("modal-help");
let mode = "viewing"; // values will be one of "searching" and "viewing"

let isModalVisible = false;
const isModalVisibleClass = "is-visible";
const node_base_color = "#BBF";
// unused collection of nicely separated colors
const polaris_color_set = [
    "#9A6324",
    "#fffac8",
    "#3cb44b",
    "#4644c0",
    "#aaffc3",
    "#e6194B",
    "#42d4f4",
    "#f032e6",
    "#ffe119",
    "#f58231",
    "#ffffff",
];
const color_scale = d3
    .scaleOrdinal()
    .domain([1, polaris_color_set.length])
    .range(polaris_color_set);
var color_step = 0;
var Graph; // Will be filled in up ahead

var Metadata; // Will be filled in up ahead

var linklist = null; // Filled up ahead. Contains list of nodes in links
var hide_nodes = false; // Whether nodes are hidden currently
var hide_node_labels = false; // Whether node labels are hidden

// ---- Graph's routines ---- //

// Converts node info to HTML for screen display
function node_to_html(node) {
    if (node && typeof node == "object" && node.hasOwnProperty("id"))
        return "id: " + node.id + ", name: <b>" + node.name + "</b>/" + node.group;
    // If "node" is already just a string
    return node;
}

// This function updates the HUD in a custom way
function hud_update(action, node) {
    let metadata_header = "<b>" + formatMetadata(Metadata) + "</b>";
    let action_header = "";
    if (action) {
        action_header = "<tiny>" + action + "</tiny>";
    }
    let mode_header = "mode: " + mode;
    let br = "<br/>";
    let info = node_to_html(node);
    hud_elt.innerHTML =
        metadata_header + br + mode_header + br + action_header + br + info + br;
}

// A zoom and fly to node function
function jetpack_to(node) {
    // node: this is the clicked node to lookAt. {x,y,z}
    // Aim at node from outside it
    const distance = 40;
    const distRatio = 1 + distance / Math.hypot(node.x, node.y, node.z);

    Graph.cameraPosition(
        // aiming at new position
        {
            x: node.x * distRatio,
            y: node.y * distRatio,
            z: node.z * distRatio,
        },
        // lookAt point
        node,
        // transition duration in ms
        3000
    );
}

// ---- Graph creation and customization ---- //

// Metadata creation

function createMetadata(metadata) {
    return metadata;
}

function formatMetadata() {
    return Metadata.satellite_name;
}

// Data loading
async function loadGraphData(jsonUrl) {
    return await fetch(jsonUrl)
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            if (data.hasOwnProperty("nodes") && data.hasOwnProperty("links")) {
                // The original format for Polaris Graph files: bare nodes &
                // links.  Return as-is.
                return data;
            } else if (data.hasOwnProperty("graph")) {
                if (data.hasOwnProperty("metadata")) {
                    Metadata = createMetadata(data.metadata);
                    // Give empty strings as arguments so that we don't have
                    // "undefined" in HUD when first called
                    hud_update("", "");
                }
                if (data.graph.data_format_version === 1) {
                    // Version 1 of Polaris Graph format
                    return data.graph;
                }
            } else {
                // Unknown format for graph file. Returning loaded data untouched.
                return data;
            }
        });
}

async function createGraph(dataFile) {
    loadGraphData(dataFile).then((data) => {
        Graph = ForceGraph3D()(graph_elt)
            .graphData(data)
            .nodeLabel((node) => node.name + ":" + node.group)
            .nodeColor((node) =>
                localStorage.getItem(node.name)
                    ? localStorage.getItem(node.name)
                    : node.color
                        ? node.color
                        : node_base_color
            )
            .onNodeHover((node) => (graph_elt.style.cursor = node ? "pointer" : null))
            .onNodeClick((node) => {
                hud_update("clicked", node);
                jetpack_to(node);
            })
            .nodeThreeObjectExtend(true)
            .nodeThreeObject((node) => {
                // add text sprite as child
                const sprite = new SpriteText(node.name);
                sprite.color = localStorage.getItem(node.name)
                    ? localStorage.getItem(node.name)
                    : node.color
                        ? node.color
                        : node_base_color;
                sprite.textHeight = 5;
                return sprite;
            })
            .linkOpacity(0.4)
            .linkWidth(1)
            // visible traveling particle(s) per link
            .linkDirectionalParticles(2)
            // Speed as a ratio of link length per frame
            // and d.value is included in [0;1]
            // as per input definition: feature importance.
            .linkDirectionalParticleSpeed((d) => d.value * 0.01);
    });
}

// ---- Search events and routines ---- //

// This function will be used to fill the datalist
// The datalist is the database for the input auto-complete
function fill_nodeslist() {
    nodeslist_elt.innerHTML = "";
    const {nodes, links} = Graph.graphData();
    for (node of nodes) {
        nodeslist_elt.innerHTML +=
            '<option value="' + node.id + ":" + node.name + "/" + node.group + '"/>';
    }
}

// Multi-function search for string
// for now search by ID.
function find_node(search_str) {
    let node_id = search_str.split(":")[0];

    const {nodes, links} = Graph.graphData();
    for (node of nodes) {
        if (node.id.toString() === node_id) {
            return node;
        }
    }

    return undefined;
}

// Highlight nodes based on the nodes names
function highlight_nodes(search_str, color, reset_color = false) {
    const regex_search = new RegExp(search_str, "i");
    const {nodes, links} = Graph.graphData();
    for (node of nodes) {
        if (reset_color) {
            node.color = color;
        } else if (node.name.match(regex_search)) {
            node.color = color;
        } else {
            node.color = localStorage.getItem(node.name)
                ? localStorage.getItem(node.name)
                : node_base_color;
        }
    }
    Graph.nodeThreeObject((node) => {
        const sprite = new SpriteText(node.name);
        if (reset_color) {
            sprite.color = color;
        } else if (node.name.match(regex_search)) {
            sprite.color = color;
        } else {
            sprite.color = localStorage.getItem(node.name)
                ? localStorage.getItem(node.name)
                : node_base_color;
        }
        sprite.textHeight = 5;
        return sprite;
    });

    Graph.nodeColor((node) => (node.color ? node.color : node_base_color));
    save_color();
}

function toggle_unlinked_node_visibility() {
    // Since we are toggling, if previously hidden, make visible
    // (true => false => true)
    hide_nodes = !hide_nodes;

    const {nodes, links} = Graph.graphData();

    // Find the list of nodes present in the link.
    // To reduce computation, do this only once
    if (linklist == null) {
        linklist = [];
        for (link of links) {
            linklist.push(link.source.id);
            linklist.push(link.target.id);
        }
        // Get only unique values
        linklist = [...new Set(linklist)];
    }

    // Find nodes present in linklist. The ones not present have visibility off
    for (node of nodes) {
        if (linklist.includes(node.id)) {
            node.nodeVisibility = true;
        } else {
            // If we have to "hide_nodes", the nodeVisibility needs to be set false
            // hide_nodes = true  => nodeVisibility = false
            // hide_nodes = false => nodeVisibility = true
            node.nodeVisibility = !hide_nodes;
        }
    }
    Graph.nodeVisibility((node) => node.nodeVisibility);
}

// Catching keypress events and launching actions
function searchInputCallback(evt) {
    // evt.key is the named key so here we're looking for "Enter"
    // NB: evt.which is deprecated so using only keyCode here.
    // NB: evt.code should be what evt.keyCode is according to W3C standards.
    //     Watch that for eventual future changes.
    let event_occurred = false;
    if (evt.keyCode === 13 || evt.key === "Enter") {
        // ASCII for Enter (Return Carriage) is 13 (Firefox)
        // For line feed this is 10 (chrome) in UIs generally ctrl+Enter is a linefeed.
        if (evt.ctrlKey) {
            if (evt.shiftKey) {
                // highlight nothing and reset
                hud_update("Resetting colors", "");
                highlight_nodes("", node_base_color, true);
                event_occurred = true;
            } else {
                // Control key is pressed: node highligting
                hud_update("highlighting search pattern", search_elt.value);
                color_step += 1;
                // if (color_step > polaris_color_set.length) prompt for user input
                // to give a new color or do nothing: colors will rotate then.
                highlight_nodes(search_elt.value, color_scale(color_step));
                event_occurred = true;
            }
        } else {
            // Control key is NOT pressed: jetpacking
            hud_update("searching", search_elt.value);
            const node = find_node(search_elt.value);

            if (node) {
                hud_update("jetpacking", node);
                jetpack_to(node);
            } else {
                hud_update("search stopped", node);
            }
            event_occurred = true;
        }
    } // --- end of "Enter" event and derivatives

    if (event_occurred) {
        // Stop processing of the event here.
        evt.stopPropagation();
        evt.preventDefault();
        search_elt.blur();
    } // Otherwise, default browser behavior should continue
}

// Callback for any event happening throughout the document
// TODO: we would like to switch to a shortcut combination for this at a later time.
function documentCallback(evt) {
    let event_occurred = false;

    // Detect toggle node shortcut key (Ctrl + /)
    if (evt.ctrlKey && evt.keyCode === 191) {
        // Toggle visibility of unlinked nodes
        toggle_unlinked_node_visibility();
        event_occurred = true;

        // Update heads up display
        let update = hide_nodes ? "Hiding nodes" : "Showing hidden nodes";
        hud_update(update, "");
    }

    // if we press h
    if (evt.keyCode === 72 || evt.key === "h") {
        if (isModalVisible) {
            modal_elt.classList.remove(isModalVisibleClass);
        } else {
            modal_elt.classList.add(isModalVisibleClass);
        }
        isModalVisible = !isModalVisible;
        event_occurred = true;
    }

    // if we press the ESC
    if (evt.key === "Escape" && document.querySelector(".modal.is-visible")) {
        document
            .querySelector(".modal.is-visible")
            .classList.remove(isModalVisibleClass);
        isModalVisible = false;
        event_occurred = true;
    }

    // if l is pressed
    if (evt.keyCode === 76 || evt.key === "l") {
        toggle_label_visibility();
        event_occurred = true;
    }

    if (event_occurred) {
        // Stop processing of the event here.
        evt.stopPropagation();
        evt.preventDefault();
    } // Otherwise, default browser behavior should continue
}

// Callback for toggling visibility for label in case of excessive crowding
function toggle_label_visibility(evt) {
    if (!hide_node_labels) {
        Graph.nodeThreeObject((node) => {
            const sprite = new SpriteText(node.name);
            sprite.color = "transparent";
            sprite.textHeight = 5;
            return sprite;
        });
    } else {
        Graph.nodeThreeObject((node) => {
            const sprite = new SpriteText(node.name);
            sprite.color = localStorage.getItem(node.name)
                ? localStorage.getItem(node.name)
                : node.color
                    ? node.color
                    : node_base_color;
            sprite.textHeight = 5;
            return sprite;
        });
    }
    hide_node_labels = !hide_node_labels;
}

// save the colors to localStorage
function save_color() {
    const {nodes, links} = Graph.graphData();
    for (node of nodes) {
        if (node.color) {
            localStorage.setItem(node.name, node.color);
        }
    }
}

function set_size() {
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight,
    };
    Graph.width(size["width"]).height(size["height"]);
}

function showToast(message) {
    // Add the "show" class to DIV
    toast_elt.innerHTML = message;
    toast_elt.className = "show";
    // After 5 seconds, remove the show class from DIV
    setTimeout(function () {
        toast_elt.className = toast_elt.className.replace("show", "");
    }, 5000);
}

// Autosave every few seconds
var intervalID = window.setInterval(save_color, 5000);

// search: Click event only to check status of datalist
search_elt.addEventListener("click", function () {
    if (nodeslist_elt.innerHTML === "") {
        fill_nodeslist();
    }
});

// search: toggle mode whenever search_element goes into focus or out of focus
search_elt.addEventListener("focus", () => {
    mode = "searching";
    hud_update("", "");
});
search_elt.addEventListener("blur", () => {
    mode = "viewing";
    hud_update("", "");
});

// Close the modal if any button with data-close parameter is clicked
const closeEls = document.querySelectorAll("[data-close]");
for (const el of closeEls) {
    el.addEventListener("click", function () {
        const modalId = this.dataset.close;
        document.getElementById(modalId).classList.remove(isModalVisibleClass);
        isModalVisible = false;
    });
}

// search: Keyboard events
search_elt.addEventListener("keydown", searchInputCallback);

// Detect keydown events in the document space (e.g. toggle hidden nodes)
document.addEventListener("keydown", (evt) => {
    // add extra condition of calling callback only if mode === viewing
    if (mode === "viewing") {
        documentCallback(evt);
    }
});

// make search element out of focus on clicking anywhere else on the document.
document.addEventListener("click", (evt) => {
    if (evt.target !== search_elt && search_elt === document.activeElement) {
        search_elt.blur();
    }
});

setTimeout(function () {
    showToast("press 'ctrl + h' to see all shortcuts");
}, 1000);

// Close the modal if clicked outside of it
document.addEventListener("click", (e) => {
    if (e.target === document.querySelector(".modal.is-visible")) {
        document
            .querySelector(".modal.is-visible")
            .classList.remove(isModalVisibleClass);
        isModalVisible = false;
    }
});
