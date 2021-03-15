// ==UserScript==
// @name         Repo Link Koppiluring
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://github.com/*/*/network/members
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const container = document.querySelector("#network");
    const button = document.createElement("button");
    button.innerText = "Copy Repo Links";
    button.style.margin = '1rem';
    container.append(button);

    button.addEventListener("click", () => {
        const repos = document.querySelectorAll('#network > .repo ');
        const repoLinks = Array.from(repos).slice(1)
          .filter(repo => repo.querySelectorAll("svg").length == 1)
          .map(repo => repo.querySelector("a:last-of-type"))
          .map( link => link.href).join("\n");

        navigator.clipboard.writeText(repoLinks).then(function() {
            console.log("Copied!");
        }, function() {
            console.log("Failed!");
        });
    });

})();
