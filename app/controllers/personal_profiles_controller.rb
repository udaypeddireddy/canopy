class PersonalProfilesController < ApplicationController
  def index 
@user = current_user
@user_profile = PersonalProfile.find_by_user_id(@user)
@new_profile = PersonalProfile.new
  end
  def new
    
  end

  def create
    @user = current_user
    @new_profile  = PersonalProfile.new(params[:personal_profile])
    @new_profile.user=current_user
   if @new_profile.save
     if consultant
        @placement = PlacementFulfilment.find_by_consultant_id(@user)
        if @placement
          @placement.user_acceptance=true
          @placement.user_acceptance_timestamp=Time.now
          @placement.save
          @vendor = Vendor.find_by_id(@placement.vendor_id)
          @subvendor_contact = VendorContact.find_by_vendor_id(@placement.subvendor_id)
          @client = Client.find(@placement.client_id)
        if @vendor
    file = File.new( "uploads/msa.doc", "w" )
File.open('uploads/msa.doc', 'r') do |f1|  
  while line = f1.gets  
    puts line  
  end  
end  
File.open('uploads/msa.doc', 'w') do |f2|  
  # use "\n" for two lines of text  
  t = Time.now
@date= t.strftime("%m/%d/%Y") 
f2.puts "subvendor"
f2.puts @subvendor_contact
 f2.puts"
VENDOR AGREEMENT / 1099


This VENDOR AGREEMENT (Agreement) is made on " + @date + " between Canopy One Solutions, Inc (CANOPY ONE), located at 4229 Lafayette Center Dr, Suite 1625, Chantilly, VA 20151 and " + @vendor.name + " with Federal Id "+@vendor.federal_id+" located at "+@vendor.address1+ " "+@vendor.address2+ ". In consideration of the mutual promises and covenants in this Agreement, the parties agree as follows, intending to be legally bound:

1.Services.  During the term of this Agreement, Vendor will provide professional computer consulting, programming and related services to one or more designated clients of CANOPY ONE (each referred to as Client).  The term Client shall include any client of CANOPY ONE to whom Vendor provides services in connection with this Agreement. Vendor shall provide services: (a) in accordance with the requirements specified by the Client in the Work Order and approved by CANOPY ONE; and (b) at the times, the location(s), and subject to the instructions and conditions determined by the Client.

2. Consultants.  When and as required by CANOPY ONE, Vendor shall furnish one or more employees who are qualified computer professionals (each, a Consultant) and who are qualified in accordance with accepted professional industry standards to perform the services required to satisfy any and all of the requirements of a Work Order.  Vendor is completely responsible for selecting the Consultant(s) to perform services under this Agreement and related Work Orders, provided that CANOPY ONE or the Client may reject any Consultant selected by Vendor. In such cases, Vendor shall promptly furnish another qualified Consultant.


3.Term.  This Agreement shall be effective upon the execution hereof by the parties and shall remain in effect for an initial period of one (1) year.  This Agreement shall automatically renew for successive periods of one year, unless and until terminated by either party as provided below  

4. Termination.  CANOPY ONE or Vendor may terminate the services under this Agreement at any time for any reason by giving four 
 weeks written notice to the other party. Canopyone may terminate any individual Purchase order with no notice, on the understanding that CANOPY ONE's Client has terminated the Purchase Order. CANOPY ONE will provide Vendor with as much notice as given to CANOPY ONE by Client, in termination of a Purchase Order.
 
 5.Payment. For each Consultant, Vendor shall submit an accurate invoice on a monthly basis along with the timesheet approved by an authorized Client representative. Canopy One will pay Vendor for services in accordance with the billing rate(s) specified in each Work Order, and will be made within Five (5) business days of receipt of funds from the client covered by the Work Order. Vendor agrees that if the Client does not pay Canopy One, or underpays Canopy One, with respect to any timesheet or invoice submitted by Vendor based on the Client disputing the timesheet or invoice, Vendor shall not be entitled to compensation from Canopy One in connection with such timesheets or invoices and any such amount already paid may be set off against any monies otherwise due and owing to Vendor. 
 
 
 6. Time Sheets and Expense Reimbursement Vendor's Consultants shall use the timesheets as provided by/or instructed by CANOPY ONE.  The time sheets, duly approved by an authorized Client representative, are to be sent via email to CANOPY ONE in the frequency specified in the Purchase Order.  If no frequency is specified, then the timesheet must be sent to CANOPY ONE weekly, within 2 working days of the end of the timesheet period. Vendor acknowledges that if a timesheet is not sent to CANOPY ONE within 3 working days, payment will be delayed.  Moreover, Vendor may not be paid if the Client does not pay CANOPY ONE due to a delay in submission of timesheets. 
 Similarly, expense statements (with original receipts attached) as pre-approved by CANOPY ONE must be submitted to CANOPY ONE no later than the 7th day of the month for all expenses incurred in the previous month.  For example, expenses incurred in the month of January must be submitted to CANOPY ONE no later than February 7th.  Vendor acknowledges that expense invoices submitted later will result in delayed reimbursement, and possible non-reimbursement, should the Client not pay CANOPY ONE for said expense.
 7.Status of Parties.  Vendor agrees and acknowledges that it is an independent contractor with respect to CANOPY ONE and the Client(s) and that neither Vendor nor any of Vendor's Consultants shall be considered an employee or agent of CANOPY ONE or the Clients.  It is further agreed that nothing in this Agreement shall be construed to create a joint venture, partnership, association or other affiliation between the parties.  It is agreed that this relationship is and shall remain that of independent parties to the contractual relationship set forth in this Agreement.  Neither Vendor nor any of Vendor's Consultants shall be eligible to participate in any employee benefit plan or program, fringe benefit plan or program, or insurance plan or program, of any kind maintained by CANOPY ONE in connection with the performance of services under this Agreement. Vendor shall be solely responsible for, payment of all federal, state and local taxes or contributions imposed or required under unemployment insurance, social security and income tax laws with respect to services performed under this Agreement. 
 
 8.Warrantly

(a) Services.  Vendor represents and warrants that it and its Consultants will provide services under this Agreement and any related Work Orders in accordance with the highest accepted industry standards.  If CANOPY ONE or the Client is not satisfied with a Consultant, for any reason, during the first two weeks such Consultant provides services under this Agreement and/or a Work Order, Vendor shall promptly replace that Consultant and shall not charge or invoice CANOPY ONE for services rendered by that Consultant.

(b) Work Product.  Vendor represents and warrants the originality of any work performed or Work Product (as defined herein) delivered under this Agreement, and that no portion of such Work Product violates or is protected by patent, copyright, trade secret, or other intellectual property or other rights of Vendor or any third party.  For purposes of this Section, Work Product shall not include materials supplied by CANOPY ONE or the Client.

In addition to the indemnity described, if an infringement claim threatens CANOPY ONE's or the Client's continued use of any Work Product completed by Vendor under this Agreement, Vendor shall in the following order and at no cost to CANOPY ONE or the Client: (i) obtain the right for CANOPY ONE and the Client to continue use of such Work Product, (ii) repair or modify the Work Product so it is both non-infringing and functionally and operationally equivalent to the Work Product initially delivered or (iii) provide replacement Work Product which is functionally and operationally equivalent to the Work Product initially delivered.  If none of the foregoing is possible, then CANOPY ONE shall have the immediate right to terminate this Agreement with full refund of all fees paid by CANOPY ONE hereunder which relate to such Work Product.

(c) Necessary Employee Contracts.  Vendor represents and warrants that it has or will obtain appropriate agreements with its employees and others, including any permitted subcontractors, whose services it may require, sufficient to enable full compliance with all the provisions of this Agreement.

(d) Conformity of Work Product.  Vendor represents and warrants that for a period of one (1) year after Vendor deliver Work Product to CANOPY ONE or the Client, such Work Product shall conform to the specifications in this Agreement and the applicable Work Order.  In the event that the Work Product does not conform to such specifications, Vendor shall, within thirty (30) days of notice from CANOPY ONE, without additional cost to CANOPY ONE, restore such Work Product to conformity or prepare a plan to do so which is acceptable to CANOPY ONE, or refund all fees paid to Vendor under the applicable Work Order.

9.Confidentiality.  Vendor acknowledges that during the course of performing this Agreement and related Work Orders, it shall have access to CANOPY ONE's and Client's trade secrets and confidential information. Vendor agrees that all such information shall be used only to accomplish the project and fulfill its obligations under this Agreement and any related Work Orders, and for no other purpose.  Vendor agrees that they shall in no manner reveal or disseminate such information to any third party.  Vendor understands that such trade secrets and confidential information shall include all past, present and/or future plans, provisions, designs, forms, formats, procedures, methods and other information relating to CANOPY ONE's and Client's technology, technical data, products, patents, copyrights, research and development programs, legal and marketing data and other technical and business information.  Confidential information and trade secrets do not include: (i) information already known to Vendor on the date of this Agreement and was obtained without any breach of confidentiality of other parties; (ii) information which is or becomes part of the public domain through no fault of Vendor; and (iii) information which is known or able to be ascertained by a non-party of ordinary skill in computer design and programming.

Upon termination of this Agreement or Work Order, or upon request of CANOPY ONE, Vendor shall return to CANOPY ONE all records, notes, data, memoranda, models, and equipment of any nature that are in Vendor's control and that are CANOPY ONE's property or relate to CANOPY ON's business.


10. Non-Disclosure of Compensation Information.  Vendor agrees that it will not disclose the rate of compensation payable under this Agreement to the Client or any other third party other than its attorneys, accountants, or other consultants or advisors or except as may be required by any governmental authority.

11. Non-Competition and Non-Solicitation. This Section shall be effective during the term of this Agreement and any renewals thereof, and for one year after the expiration of the initial period and any renewal periods, whichever is later.  Vendor shall not directly contact a Client of CANOPY ONE, without written permission from CANOPY ONE.  In addition, Vendor represents and warrants that it has obtained or will obtain a binding commitment from any Vendor employee who provides services under this Agreement or any related Work Order to refrain from voluntarily informing any Client of his or her employment status with Vendor.   Vendor additionally agrees not to provide or attempt to provide (or advise others of the opportunity to provide) directly or indirectly, any services to any such Client to which Vendor has been introduced, or about which Vendor has received information through CANOPY ONE or through any Client of CANOPY ONE for which Vendor has performed services or to which Vendor was introduced under this Agreement.

During the term of this Agreement and for one year following its termination, Vendor shall not offer any employment or other form of services directly or indirectly either by itself or through its affiliates to any of individual employed by CANOPY ONE of the Client who Vendor has contact with in connection with this Agreement or any related Work Order.  During the above time period, CANOPY ONE shall not offer any employment or other form of services directly or indirectly either by itself or through its affiliates to any of individual employed by Vendor who CANOPY ONE has contact with in connection with this Agreement or any related Work Order.  


12. Intellectual Property.    Vendor agrees that all ideas, inventions, improvements, documents, information or other data generated or developed while rendering services pursuant to this Agreement and related Work Orders, including but not limited to any and all source and object code, applicable documentation, information, data, models, equations, studies, calculations, solutions, reports, drawings, process flows, modifications and/or adaptations of existing software and inventions developed or reduced to practice by Vendor while providing such services (hereinafter 'Work Product'), shall be the sole and exclusive property of CANOPY ONE and may be used by CANOPY ONE for any purpose whatsoever without Vendor's consent, and without obligation of any further compensation to Vendor and shall be delivered by Vendor to CANOPY ONE.  Consultant shall not use any portion of the Work Product in any projects for any third party.

         
    To the extent permitted by law, any Work Product created as a result of this Agreement will constitute works made for hire, and the ownership of such Work Product will vest in CANOPY ONE at the time it is created.  To the extent such Work Product does not constitute works made for hire under applicable law, Consultant hereby assigns and transfers to CANOPY ONE all right, title and interest that Vendor may now or hereafter have in that Work Product, subject to the limitations set forth below.  Vendor shall promptly disclose to CANOPY ONE all such Work Product.  Vendor shall take such action (including, but not limited to, the execution, acknowledgment, delivery and assistance in preparation of documents or the giving of testimony) as may be requested by CANOPY ONE to evidence, transfer, vest or confirm CANOPY ONE right, title and interest in such Work Product.
  
Nothing in this Agreement shall obligate Vendor to assign or offer to assign any of its rights in an invention for which no equipment, supplies, facilities or trade secret information of CANOPY ONE or CANOPY ONE's Client was used and which was developed entirely on Vendor's own time, unless: (a) the invention relates directly to the business of CANOPY ONE or the Client, or to CANOPY ONE's or the Client's actual or demonstrably anticipated research or development; or (b) the invention results from any work performed by Vendor for CANOPY ONE or the Client.

13. Indentification.  Vendor shall indemnify, defend and hold harmless CANOPY ONE, the Client and their respective parents, affiliates, subsidiaries, directors, officers, shareholders, employees, agents and representatives from and against any and all liability claims, demands or causes of action, including reasonable attorney's fees, resulting from: (a) any act or omission by such Vendor, or its Consultants, officers, agents or employees in connection with this Agreement or related Work Order; or (b) any breach by Vendor of any provision, warranty or representation in this Agreement or related Work Order.  In addition, Vendor shall indemnify CANOPY ONE from and against all liability and loss, including reasonable attorney's fees, in connection with, and shall assume full responsibility for, payment of all federal, state and local taxes or contributions imposed or required under unemployment insurance, social security and income tax laws with respect to services performed under this Agreement and any related Work Order.  

14. Limitation of Liability.  In no event shall CANOPY ONE be liable to Vendor for any third party claim or for any indirect, special or consequential damages, including but not limited to lost profits, in connection with or arising out of this Agreement or any related Work Order, whether or not CANOPY ONE has been advised of the possibility of such damages.  CANOPY ONE makes no representations or guarantees, expressed or implied, regarding the total number of hours that Vendor may work or revenue that may ultimately be derived by Vendor as a result of this Agreement.

15. Insurance.  Vendor shall maintain liability insurance in favor of the Client, in amounts satisfactory to the CANOPY ONE to cover Vendor's indemnification responsibilities set forth above.    Vendor shall also maintain statutory Workers Compensation Insurance on all of its Subcontractor Employees.   Vendor shall provide Canopy One Solutions, Inc. with certificates of insurance evidencing such coverage and listing Canopy One Solutions, Inc. as an additional insured on such policies.  All policies of insurance shall provide for 30 days written notice of cancellation to Canopy One Solutions, Inc.  

16. Other Agreements.  Vendor represents that its execution, delivery and performance of this Agreement shall not violate any other employment, nondisclosure, confidentiality, consulting or any other agreement to which Vendor is a party or by which it may be bound.  Vendor shall not use, in the performance of the services hereunder, or disclose to CANOPY ONE or its Client any confidential or proprietary information of any other party if such use or disclosure would violate any obligation or duty that Vendor owes to such other party.  Consultant's compliance with this Section shall not prohibit, restrict or impair Vendor's performance of services and its other obligations and duties to CANOPY ONE.

17. Priority.  During the term of this Agreement, Vendor shall allocate all reasonable and necessary resources to perform the services or a particular Work Order in an expedient manner until completion.  Vendor acknowledges that time is of the essence in the performance of services under this Agreement.

18. Subcontracting by Vendor.  Vendor may subcontract specific project assignments under this Agreement only after obtaining written permission from CANOPY ONE.


19. Assignment.  Neither party may assign its rights and obligations under this Agreement nor did any relate Work Order without the express written consent of the other party.


20. Governing Law.  This Agreement and any related Work Orders shall be governed by the law of the State of Virginia without regard to principles of conflicts of laws.  Any legal action to interpret or enforce the terms of this Agreement or any related Work Orders shall be brought only in the state or federal courts, as applicable, located in State of Virginia. 


21. Notices.  Any notice, request or other communication made or given in connection with this Agreement shall be in writing and shall be deemed to have been duly given when delivered or mailed by registered or certified mail, return receipt requested, or by facsimile or by hand delivery, to those listed below at their following respective addresses or at such other address as each may specify by notice to the others:



To:  Canopy One Solutions, Inc:
Canopy One Solutions, Inc
4229 Lafayette Center Dr. Suite 1625 
Chantilly, VA 20151
Attention: Legal Department



To Name of Vendor
"+@vendor.name+"
"+@vendor.address1+"
"+@vendor.address2+"




22. Enforceability.  If any term or provision of this Agreement is declared illegal or unenforceable by any court of competent jurisdiction and cannot be modified to be enforceable, such term or provision shall immediately become null and void, leaving the remainder of this Agreement in full force and effect.


23. Waiver.  The failure of a party to insist upon strict adherence to any term of this Agreement on any occasion shall not be considered a waiver thereof or deprive that party of the right thereafter to insist upon strict adherence to that term or any other term of this Agreement.


24. Entire Agreement.  This Agreement shall inure to the benefit of and shall be binding upon CANOPY ONE, its successors and assigns and shall be binding upon Vendor in accordance with its terms.  This Agreement shall supersede any and all existing oral or written agreements, representations, or warranties between Vendor and CANOPY ONE.  It may not be amended except by a written agreement signed by both parties.

IN WITNESS WHEREOF, the parties have executed this Agreement, intending to be legally bound, as of the day and year written above.





Accepted by:            Accepted by: 


       
______________________________                                                                                                      
Name: ""           

Title: ""           
Date: __"+@date+"_________       

For: Canopy One Solutions, Inc
4229 Lafayette Center Dr, Suite 1625, 
Chantilly, VA 20151


"

end
end

UserMailer.user_agreement(@user).deliver
end
end    
redirect_to user_personal_profiles_path(@user), :notice=>'Profile Created Successfully'

else
    render :index 
   end
end
  
  def show 
   @user = current_user
   @profile = PersonalProfile.find_by_user_id(@user)
  end
 
 
 def edit
   
  @user = current_user
 @profile = PersonalProfile.find_by_user_id(@user)
   
 end 
 
def update
@user = current_user
@profile = PersonalProfile.find_by_user_id(@user)
 
@profile.update_attributes(params[:personal_profile])

redirect_to user_personal_profile_path(@profile), :notice=>'Profile Updated Successfully'

   
 
 end
 def changepwd

@user = current_user
@user.password = params[:password]
@user.password_reset = true
if @user.save

redirect_to changepassword_path, :notice=>"Password Successfully Changed"
else
  
  render :changepassword 
end
end
 def destroy
   @profile = PersonalProfile.find(params[:id])
   @profile.destroy
   redirect_to personal_profiles_path
 end
 
end
