// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


function sendRequest(empl_id) {
    switch (iconClick(empl_id)) {
        case true:
            const Http = new XMLHttpRequest();
            const url = '/employees/json/' + empl_id;
            Http.open("GET", url);
            Http.setRequestHeader("Content-type", "application/json");
            Http.send();
            let children;
            Http.onreadystatechange = (e) => {
                if (Http.status === 200 && Http.readyState === 4) {
                    children = JSON.parse(Http.responseText);
                    if (children.length === 0) {
                        let icon = document.getElementById('empl_'+empl_id);
                        icon.children[0].style.display = 'none';
                    } else {
                        let currentNode = document.getElementById('node_' + empl_id);
                        for (const key in children) {
                            let childNode = document.createElement('ul');
                            childNode.className = "tree";
                            childNode.id = "node_" + children[key]['id'];
                            childNode.innerHTML = `<li class="node" id=${"node_" + children[key]['id']}>
                                <p class="m-0 d-inline-block" id=${"empl_" + children[key]['id']} onclick="sendRequest(${children[key]['id']})">
                                    <i class="fas fa-plus"></i>
                                </p>
                                <p class="m-0 d-inline-block">${children[key]['name']}</p></li>`;
                            currentNode.appendChild(childNode);
                        }
                    }
                }
            };
            break;
        case false:
            let currentNode = document.getElementById('node_' + empl_id);
            let chID = [];
            for (const key in currentNode.children) {
                if (currentNode.children[key].tagName === "UL") {
                    chID[key] = currentNode.children[key].id;
                }
            }
            chID.forEach((el) => {
                currentNode.removeChild(document.getElementById(el));
            });
            break;
        case -1:
            // console.log('another error');
            break;

    }
}

/*
@return true: should get assistants, else: should remove assistants from DOM; -1 - another error
 */
function iconClick(id) {
    let pic = document.getElementById("empl_" + id);
    if (pic.firstElementChild.className === "fas fa-plus") {
        pic.firstElementChild.className = "fas fa-minus";
        return true;
    } else if (pic.firstElementChild.className === "fas fa-minus") {
        pic.firstElementChild.className = "fas fa-plus";
        return false;
    } else {
        return -1;
    }
}
