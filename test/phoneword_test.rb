require 'test_helper'

class PhonewordTest < Minitest::Test

  def test_runs_correctly_against_stub1
    stub =
      [
        ['motor', 'usual'], ['noun', 'struck'],
        ['nouns', 'truck'], ['nouns', 'usual'],
        ['onto', 'struck'], 'motortruck'
      ]
    result = ::Phoneword::Converter.new(phone: 6686787825).process
    assert_equal stub, result
  end

  def test_runs_correctly_against_stub2
    stub =
      [
        ['act', 'amounts'], ['act', 'contour'],
        ['acta', 'mounts'], ['bat', 'amounts'],
        ['bat', 'contour'], ['cat', 'contour'], 'catamounts'
      ]
    result = ::Phoneword::Converter.new(phone: 2282668687).process
    assert_equal stub, result
  end

end
