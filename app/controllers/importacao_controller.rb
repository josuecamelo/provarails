require 'csv'

class ImportacaoController < ApplicationController
	def new
		
	end

	def create
		uploaded_io = params[:arquivo]
		caminho = Rails.root.join('public', 'uploads', uploaded_io.original_filename)

		if File.exist?(caminho)
			FileUtils.rm_rf Dir.glob("#{Rails.root}/public/uploads/*")
		end

		File.open(caminho, 'wb') do |file|
		  file.write(uploaded_io.read)
		end

		CSV.foreach(caminho, col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
       			Carro.create!(marca: linha[0], modelo: linha[1], disponivel: true)
     		end
		end

		respond_to do |format|
            format.html { redirect_to carros_url, notice: 'Importação Realizada com Sucesso!' }
        end
	end
end
