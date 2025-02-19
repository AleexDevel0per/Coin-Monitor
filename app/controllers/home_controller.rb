require "net/http"
require "json"
include ActionView::Helpers::NumberHelper  # Importa os helpers do Rails

class HomeController < ApplicationController
  CURRENCIES = [
    { code: "USD-BRL" },
    { code: "EUR-BRL" },
    { code: "BTC-BRL" }
  ]

  def index
    @chart_data = []
    @formatted_values = {}
    @latest_values = {}

    CURRENCIES.each do |currency|
      url = URI("https://economia.awesomeapi.com.br/json/daily/#{currency[:code]}/16")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      hash = {}
      formatted_hash = {}

      data.each do |entry|
        date = Time.at(entry["timestamp"].to_i).strftime("%d/%m/%Y")
        rate = entry["high"].to_f.round(2)

        hash[date] = rate

        precision = currency[:code] == "BTC-BRL" ? 0 : 2
        formatted_hash[date] = number_to_currency(rate, unit: "R$", separator: ",", delimiter: ".", precision: precision)
      end

      # Pega o último valor disponível na API
      latest_rate = data.first["high"].to_f.round(2)
      @latest_values[currency[:code]] = number_to_currency(latest_rate, unit: "R$", separator: ",", delimiter: ".", precision: currency[:code] == "BTC-BRL" ? 0 : 2)

      @chart_data << { name: currency[:code], data: hash }
      @formatted_values[currency[:code]] = formatted_hash
    end
  end

  def latest_values
    latest_values = {}

    CURRENCIES.each do |currency|
      url = URI("https://economia.awesomeapi.com.br/json/last/#{currency[:code]}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      latest_rate = data[currency[:code].gsub("-", "")]["high"].to_f.round(2)

      latest_values[currency[:code]] = number_to_currency(latest_rate, unit: "R$", separator: ",", delimiter: ".", precision: currency[:code] == "BTC-BRL" ? 0 : 2)
    end

    render json: latest_values
  end

  def update_chart
    # Adicione a lógica para atualização do gráfico aqui
  end
end
