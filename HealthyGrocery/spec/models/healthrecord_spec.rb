require 'spec_helper.rb'

describe "A healthrecord" do 
	context "should not"do

     it "be created without a name" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )
         
         expect(health_record).to be_valid 
         end


    it "be created without a age" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, program: "Gain Weight", gender: "Male", race: "Caucasion" )

         expect(health_record).to have(2).errors_on(:age) 
         end
   

    it "be created without a height" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12,
          weight: 12, program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )
         
         expect(health_record).to have(2).errors_on(:height) 
         end


    it "be created without a weight" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
           program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )

         expect(health_record).to have(2).errors_on(:weight) 
         end


    it "be created without a race" do
        health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, program: "Gain Weight", age: 12 , gender: "Male")
         
         expect(health_record).to have(1).errors_on(:race) 
         end

      

    it "be created without a program" do
        health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, age: 12 , gender: "Male", race: "Caucasion" )
         
         expect(health_record).to have(1).errors_on(:program) 
         end


    it "be created without a gender" do
        health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, program: "Gain Weight", age: 12 , race: "Caucasion" )
         
         expect(health_record).to have(1).errors_on(:gender) 
         end



    it "be created String height" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12, height: "one",
          weight: 12, program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )

         expect(health_record).to have(1).errors_on(:height) 
         end


    it "be created String weight" do
        health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: "one", program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )

         expect(health_record).to have(1).errors_on(:weight) 
         end
      

    # it "be created String fats" do
    #     health_record = Healthrecord.new(name: 'sameh', fats: "one", height: 12,
    #       weight: 12, program: "Gain Weight", age: 12 , gender: "Male", race: "Caucasion" )

    #      expect(health_record).to have(1).errors_on(:fats) 
    #      end


    it "be created String age" do
         health_record = Healthrecord.new(name: 'sameh', fats: 12, height: 12,
          weight: 12, program: "Gain Weight", age: "zero" , gender: "Male", race: "Caucasion" )

         expect(health_record).to have(1).errors_on(:age) 
         end


     end
	
end