require 'rails_helper'

describe "Books API", type: :request do 
    
    describe "GET /books" do
        it "return all books" do
            FactoryBot.create(:book, author: "1984", title: "George Orwell")
            FactoryBot.create(:book, author: "Alchemist", title: "Paulo Cohelo")

            get '/api/v1/books'

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe "POST /books" do
        it "creates a book" do
            expect{
                post '/api/v1/books', params: { book: {author: "Jonathan Swift", title: "Gullivers Travels"}}
            }.to change { Book.count }.from(0).to(1) 

            expect(response).to have_http_status(:created)
        end
    end
end