require_relative '../test_helper'
class HashableTest < Test::Unit::TestCase

def test_to_hash
  patient = FHIR::Patient.new
  patient_hash = patient.to_hash
  assert patient_hash.is_a?(Hash)
end

end