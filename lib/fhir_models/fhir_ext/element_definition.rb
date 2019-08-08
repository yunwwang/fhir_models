module FHIR
  # Extend ElementDefinition for profile validation code
  class ElementDefinition < FHIR::Model
    def choice_type?
      path&.end_with? '[x]'
    end
  end
end
