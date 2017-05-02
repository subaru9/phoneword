require 'test_helper'

class PhonewordTest < Minitest::Test

  def test_runs_correctly_against_stub1
    stub =
      [
        ['MOTOR', 'USUAL'], ['NOUN', 'STRUCK'],
        ['NOUNS', 'TRUCK'], ['NOUNS', 'USUAL'],
        ['ONTO', 'STRUCK'], 'MOTORTRUCK'
      ]
    result = ::Phoneword::Converter.new(phone: 6686787825).process
    assert_equal stub, result
  end

  def test_runs_correctly_against_stub2
    stub =
      [
        ['ACT', 'AMOUNTS'], ['ACT', 'CONTOUR'],
        ['ACTA', 'MOUNTS'], ['BAT', 'AMOUNTS'],
        ['BAT', 'CONTOUR'], ['CAT', 'CONTOUR'], 'CATAMOUNTS'
      ]
    result = ::Phoneword::Converter.new(phone: 2282668687).process
    assert_equal stub, result
  end

end
