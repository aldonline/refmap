chai = require 'chai'
should = chai.should()

refmap = require '../lib/refmap'

describe 'a refmap', ->
  rm = refmap()
  it 'should be a function', ->
    rm.should.be.a 'function'
  it 'should accept a value via set(). returning true if a change was made', ->
    r = rm.set 'a', 'A'
    r.should.equal true
  it 'should return said value', -> rm.get('a').should.equal 'A'
  it 'should return false if we try to set the same value', ->
    rm.set('a','A').should.equal false

  it 'should accept a new value via set(). returning true if a change was made', ->
    r = rm.set 'a', 'B'
    r.should.equal true
  it 'should return said value', -> rm.get('a').should.equal 'B'

  it 'should get() by calling f.apply directly', -> rm('a').should.equal 'B'
  it 'should set() by calling f.apply directly', -> rm('a', 'C').should.equal true
  it 'and return said value', -> rm.get('a').should.equal 'C'

  it 'should return undefined for a value that does not exist', ->
    should.not.exist rm('c')

  it 'should also allow us to test via exists()', ->
    rm.exists('c').should.equal false
    rm.exists('a').should.equal true

  it 'should be able to delete a value', ->
    rm.del('a').should.equal true
    rm.exists('a').should.equal false

  it 'should allow us to get all keys', ->
    rm.keys().should.be.empty
    rm 'x', 'y'
    rm.keys().should.have.length 1
    rm 'z', 'z'
    rm.keys().should.have.length 2
    rm 'z', 'z'
    rm.keys().should.have.length 2

  it 'should delete everything when calling clear()', ->
    rm.size().should.equal 2
    rm.clear()
    rm.size().should.equal 0