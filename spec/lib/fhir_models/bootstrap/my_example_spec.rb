describe 'FHIR::JSON' do

  it 'allows FHIR::Models to be represented as JSON' do
    patient = FHIR::Patient.new
    expect(patient.to_json).to eq("{\n  \"resourceType\": \"Patient\"\n}")
  end
end