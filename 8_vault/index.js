const ethers = require('ethers');

const address = "0xc364DF44d1fA84d8Ff722E7cB57376592BAc804F";
const slot = 1;

async function readPrivateVariableValue(address, slot) {
    
    // default provider for rinkeby network
    const provider = ethers.getDefaultProvider(4);
    const bytes32 = await provider.getStorageAt(address, slot);
    const password = hex2a(bytes32);
    console.log("password:", password);
    console.log("bytes32:", bytes32);
}

readPrivateVariableValue(address, slot);

function hex2a(hexx) {
    var hex = hexx.toString();//force conversion
    var str = '';
    for (var i = 0; i < hex.length; i += 2)
        str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
    return str;
}