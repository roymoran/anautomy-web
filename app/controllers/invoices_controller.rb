class InvoicesController < ApplicationController

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    #respond_to do |format|
      #if @invoice.save
        #format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        #format.json { render :show, status: :created, location: @invoice }
      #else
        #format.html { render :new }
        #format.json { render json: @invoice.errors, status: :unprocessable_entity }
      #end
    #end
    if @invoice.save 
    # @repairSubmission.create_car is used to create and save the associated car to
    # the repair submission. Params passed by new action is passed as field values

    #SubscriberMailer.repair_submission_email(@repairSubmission).deliver_now
    redirect_to root_path
    #respond_to do |format|
      #add fallback to html
    #format.js # actually means: if the client ask for js -> return file.js
      #end
    else
      #respond_to do |format|
        #add fallback to html
      #format.js
      #end
      redirect_to action: :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:invoice_image)
    end
end
