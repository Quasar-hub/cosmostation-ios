// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: panacea/did/v2/query.proto

package panacea.did.v2;

public final class QueryOuterClass {
  private QueryOuterClass() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistryLite registry) {
  }

  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
    registerAllExtensions(
        (com.google.protobuf.ExtensionRegistryLite) registry);
  }
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_panacea_did_v2_QueryDIDRequest_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_panacea_did_v2_QueryDIDRequest_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_panacea_did_v2_QueryDIDResponse_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_panacea_did_v2_QueryDIDResponse_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static  com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    java.lang.String[] descriptorData = {
      "\n\032panacea/did/v2/query.proto\022\016panacea.di" +
      "d.v2\032\034google/api/annotations.proto\032*cosm" +
      "os/base/query/v1beta1/pagination.proto\032\030" +
      "panacea/did/v2/did.proto\"%\n\017QueryDIDRequ" +
      "est\022\022\n\ndid_base64\030\001 \001(\t\"U\n\020QueryDIDRespo" +
      "nse\022A\n\025did_document_with_seq\030\001 \001(\0132\".pan" +
      "acea.did.v2.DIDDocumentWithSeq2|\n\005Query\022" +
      "s\n\003DID\022\037.panacea.did.v2.QueryDIDRequest\032" +
      " .panacea.did.v2.QueryDIDResponse\")\202\323\344\223\002" +
      "#\022!/panacea/did/v2/dids/{did_base64}B0P\001" +
      "Z,github.com/medibloc/panacea-core/x/did" +
      "/typesb\006proto3"
    };
    descriptor = com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
          com.google.api.AnnotationsProto.getDescriptor(),
          cosmos.base.query.v1beta1.Pagination.getDescriptor(),
          panacea.did.v2.Did.getDescriptor(),
        });
    internal_static_panacea_did_v2_QueryDIDRequest_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_panacea_did_v2_QueryDIDRequest_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_panacea_did_v2_QueryDIDRequest_descriptor,
        new java.lang.String[] { "DidBase64", });
    internal_static_panacea_did_v2_QueryDIDResponse_descriptor =
      getDescriptor().getMessageTypes().get(1);
    internal_static_panacea_did_v2_QueryDIDResponse_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_panacea_did_v2_QueryDIDResponse_descriptor,
        new java.lang.String[] { "DidDocumentWithSeq", });
    com.google.protobuf.ExtensionRegistry registry =
        com.google.protobuf.ExtensionRegistry.newInstance();
    registry.add(com.google.api.AnnotationsProto.http);
    com.google.protobuf.Descriptors.FileDescriptor
        .internalUpdateFileDescriptor(descriptor, registry);
    com.google.api.AnnotationsProto.getDescriptor();
    cosmos.base.query.v1beta1.Pagination.getDescriptor();
    panacea.did.v2.Did.getDescriptor();
  }

  // @@protoc_insertion_point(outer_class_scope)
}
