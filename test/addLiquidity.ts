import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("addLiquidity", async () => {

    const toWei = (amountInEthers: string) => ethers.utils.parseEther(amountInEthers);

    async function deployFixture() {
        const [owner, alice] = await ethers.getSigners();

        const TOKEN_NAME = "My Token";
        const TOKEN_SYMBOL = "MTK";
        const SUPPLY = 10000;

        const Token = await ethers.getContractFactory("TokenV1");
        const token = await Token.deploy(TOKEN_NAME, TOKEN_SYMBOL, SUPPLY);

        const Exchange = await ethers.getContractFactory("Exchange");
        const exchange = await Exchange.deploy(token.address);

        return { token, exchange, owner, alice };
    }

    it("add liquidity", async () => {
        const { token, exchange } = await loadFixture(deployFixture);

        await token.approve(exchange.address, toWei("200"));
        await exchange.addLiquidity(toWei("200")), { value: toWei("100") };

    });

});



