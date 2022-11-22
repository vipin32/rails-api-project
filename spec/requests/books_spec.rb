require 'rails_helper'

describe "Books Api", type: :request do 
    it "return all books" do
        FactoryBot.create(:book, author: "1984", title: "George Orwell")
        FactoryBot.create(:book, author: "Alchemist", title: "Paulo Cohelo")

        get '/api/v1/books'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end

end