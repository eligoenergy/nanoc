# encoding: utf-8

class Nanoc::ChecksumStoreTest < Nanoc::TestCase

  def test_get_with_existing_object
    require 'pstore'

    # Create store
    FileUtils.mkdir_p('tmp/test')
    pstore = PStore.new('tmp/test/checksums')
    pstore.transaction do
      pstore[:data] = { [ :item, '/moo/' ] => 'zomg' }
      pstore[:version] = 1
    end

    # Check
    store = Nanoc::ChecksumStore.new(:test)
    store.load
    obj = Nanoc::Item.new('Moo?', {}, '/moo/')
    assert_equal 'zomg', store[obj]
  end

  def test_get_with_nonexistant_object
    store = Nanoc::ChecksumStore.new(:test)
    store.load

    # Check
    obj = Nanoc::Item.new('Moo?', {}, '/animals/cow/')
    assert_equal nil, store[obj]
  end

end
