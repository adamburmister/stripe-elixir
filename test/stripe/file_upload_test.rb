require File.expand_path("../../test_helper", __FILE__)

module Stripe
  class FileUploadTest < Test::Unit::TestCase
    # Note that these tests are written different from others because we
    # don't have anything on the uploads service in our OpenAPI spec. This is
    # something that should be looked into at some point. We may need to ship
    # a separate spec for it though, so it's high effort with low reward for
    # the time being.
    FIXTURE = {
      id: "file_123",
      object: "file_upload",
    }.freeze

    should "be listable" do
      stub_request(:get, "#{Stripe.uploads_base}/v1/files")
        .to_return(body: JSON.generate(data: [FIXTURE],
                                       object: "list",
                                       resource_url: "/v1/files"))

      files = Stripe::FileUpload.list
      assert files.data.is_a?(Array)
      assert files.data[0].is_a?(Stripe::FileUpload)
    end

    should "be retrievable" do
      stub_request(:get, "#{Stripe.uploads_base}/v1/files/file_123")
        .to_return(body: JSON.generate(FIXTURE))

      file = Stripe::FileUpload.retrieve("file_123")
      assert file.is_a?(Stripe::FileUpload)
    end

    should "be creatable with a File" do
      stub_request(:post, "#{Stripe.uploads_base}/v1/files")
        .with(headers: {
          "Content-Type" => /\A#{Faraday::Request::Multipart.mime_type}/,
        }) do |request|
        request.body =~ /FileUploadTest/
      end.to_return(body: JSON.generate(FIXTURE))

      file = Stripe::FileUpload.create(
        purpose: "dispute_evidence",
        file: File.new(__FILE__)
      )
      assert file.is_a?(Stripe::FileUpload)
    end

    should "be creatable with a Tempfile" do
      stub_request(:post, "#{Stripe.uploads_base}/v1/files")
        .with(headers: {
          "Content-Type" => /\A#{Faraday::Request::Multipart.mime_type}/,
        }) do |request|
        request.body =~ /Hello world/
      end.to_return(body: JSON.generate(FIXTURE))

      tempfile = Tempfile.new("foo")
      tempfile.write("Hello world")
      tempfile.rewind

      file = Stripe::FileUpload.create(
        purpose: "dispute_evidence",
        file: tempfile
      )
      assert file.is_a?(Stripe::FileUpload)
    end

    should "be creatable with Faraday::UploadIO" do
      stub_request(:post, "#{Stripe.uploads_base}/v1/files")
        .with(headers: {
          "Content-Type" => /\A#{Faraday::Request::Multipart.mime_type}/,
        }) do |request|
        request.body =~ /FileUploadTest/
      end.to_return(body: JSON.generate(FIXTURE))

      file = Stripe::FileUpload.create(
        purpose: "dispute_evidence",
        file: Faraday::UploadIO.new(File.new(__FILE__), nil)
      )
      assert file.is_a?(Stripe::FileUpload)
    end
  end
end
