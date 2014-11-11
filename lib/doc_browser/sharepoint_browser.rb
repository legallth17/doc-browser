class SharePointBrowser 
	attr_accessor :sharepoint_library

	def initialize
	end

	def list_documents(path)
	    sharepoint_library.list_documents
	end
end
