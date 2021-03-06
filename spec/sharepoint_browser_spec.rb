require "doc_browser/sharepoint_browser"

describe SharePointBrowser do
    documents = [ { :name => "document 1", :path => "/folder1/folder2/document1.doc" },
                  { :name => "document 2", :path => "/folder1/folder2/document2.doc" } ]
                  
    let(:subject) { SharePointBrowser.new } 
    let(:sharepoint_library) { double "sharepoint_library" }
    
    before(:each) do
        allow(sharepoint_library).to receive(:list_documents) { <<EOS
        <xml>
            <item>
                <name>document 1</name>
                <path>/folder1/folder2</path>
            </item>
            <item>
                <name>document 2</name>
                <path>/folder1/folder2</path>
            </item>
            <item>
                <name>document 3</name>
                <path>/folder1/folder2/folder3</path>
            </item>
            <item>
                <name>document 4</name>
                <path>/folder1/folder2/folder3</path>
            </item>
            <item>
                <name>document 5</name>
                <path>/folder1/folder2</path>
            </item>
        </xml>
EOS
}
        subject.sharepoint_library = sharepoint_library

    end
    
	it "lists documents from a path" do
		expect(subject.list_documents("/folder1/folder2")).to eq(documents)
	end
end
