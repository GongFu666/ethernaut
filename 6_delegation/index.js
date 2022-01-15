const ethers = require('ethers');

const message = "pwn()";

function getMessageData() {

    let str = ethers.utils.keccak256(ethers.utils.toUtf8Bytes(message));
    // reduce to first 10 characters
    str = str.substring(0, 10);
    // add padding
    str += "00000000000000000000000000000000000000000000000000000000";
    console.log(str);
}

getMessageData();