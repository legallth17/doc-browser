require "spec_helper"
require "doc_browser/sharepoint_library"

describe SharePointLibrary do
	it "lists documents in xml" do
		expect(subject.list_documents()).to eq("<xml></xml>")
	end
end
