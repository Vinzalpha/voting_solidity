const Voting = artifacts.require('./Voting.sol')

contract('Voting', (account) => {
    let voting;

    before(async () => {
        voting = await Voting.deployed();
    })

    it('deploys successfully', async () => {
        const address = await voting.address
        assert.notEqual(address, 0x0)
        assert.notEqual(address, '')
        assert.notEqual(address, null)
        assert.notEqual(address, undefined)
    })

    // it('candidate OK', async () => {
    //    const candidate = await voting.getCandidate()
    //    assert.equal(candidate, 'Candidate1')
    // })
    
})