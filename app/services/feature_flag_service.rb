class FeatureFlagService
  def self.check_feature_flag(feature_key, context_attributes, default_value = false)
    # Crear el contexto enriquecido
    context = create_launchdarkly_context(context_attributes)

    # Obtener el valor del feature flag
    fetch_feature_flag(feature_key, context, default_value)
  end

  private

  def self.create_launchdarkly_context(attributes)
    # Extraer el 'key' y otros atributos del hash
    key = attributes.delete(:key)
    raise "Context must include a 'key'" unless key.present?

    # Crear el contexto con los atributos proporcionados
    LaunchDarkly::LDContext.create(key: key, **attributes)
  rescue StandardError => e
    Rails.logger.error("Error creating LaunchDarkly context: #{e.message}")
    raise "Failed to create LaunchDarkly context."
  end

  def self.fetch_feature_flag(feature_key, context, default_value)
    Rails.configuration.client.variation(feature_key, context, default_value)
  rescue StandardError => e
    Rails.logger.error("Error fetching feature flag '#{feature_key}': #{e.message}")
    default_value
  end
end