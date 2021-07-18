import chai from 'chai'
import { solidity } from 'ethereum-waffle'
import { ethers } from 'hardhat'
import { Parent } from '../typechain/Parent'

chai.use(solidity);
const { expect, assert } = chai;

const assertError = async (f: Function, s: string, e: string) => {
    let didError = false;
    try {
      await f();
    } catch (e) {
      assert(e.toString().includes(s), `error string ${e} does not include ${s}`);
      didError = true;
    }
    assert(didError, e);
  };

describe("Parent", async function () {
    describe("Parent and Child are reentrant?", async function () {
        it("Should fail to construct when reading or writing from parent", async function() {
            this.timeout(0)

            const parentReadFactory = await ethers.getContractFactory('ParentRead')
            await assertError(
                async () => await parentReadFactory.deploy(),
                `Error: Transaction reverted: function call to a non-contract account`,
                `Failed to prevent reentrant constructor call`,
            )

            const parentWriteFactory = await ethers.getContractFactory('ParentWrite')
            await assertError(
                async () => await parentWriteFactory.deploy(),
                `Error: Transaction reverted: function call to a non-contract account`,
                `Failed to prevent reentrant constructor call`,
            )
        })
    })
})