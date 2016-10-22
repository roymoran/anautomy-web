class AddAttachmentInvoiceImageToInvoices < ActiveRecord::Migration
  def self.up
    change_table :invoices do |t|
      t.attachment :invoice_image
    end
  end

  def self.down
    remove_attachment :invoices, :invoice_image
  end
end
