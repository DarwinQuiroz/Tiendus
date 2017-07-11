class LinksController < ApplicationController
    before_action :find_link
    before_action :find_attachment_link, only: :download_attachment
    before_action :validate_link
    before_action :validate_attachment_link, only: :download_attachment

    def download
        @link.update_downloads
        @product = @link.product
        @link.create_attachment_links
        @link_attchments = @link.links
    end

    def download_attachment
        send_file(Rails.root.join("archivos","#{@link_attchment.attachment_id}","original",@link_attchment.attachment.archivo_file_name))
    end

    private
        def validate_attachment_link
            if @link_attchment.is_invalid?
                redirect_to invalid_path, notice: "Expiró el tiempo para descargar este archivo.!"
            end
        end

        def validate_link
            if @link.nil? || @link.is_invalid?
                redirect_to invalid_path, notice: "El link de decarga no es válido o ha expirado.!"
            end
        end

        def find_link
            @link = Link.find_by(custom_id:params[:id])
        end

        def find_attachment_link
            @link_attchment = AttachmentLink.find(params[:attachment_id])
        end
end