# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tensors.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tensors.proto", :syntax => :proto3) do
    add_message "tensors.Tensor" do
      optional :dtype, :enum, 1, "tensors.Dtype"
      repeated :shape, :int64, 2
      optional :data, :bytes, 3
      proto3_optional :attr_type, :enum, 4, "tensors.AttributeType"
    end
    add_message "tensors.Attribute" do
      optional :name, :string, 1
      oneof :value do
        optional :module, :message, 3, "tensors.Module"
        optional :tensor, :message, 4, "tensors.Tensor"
        optional :string, :string, 5
        optional :int64, :int64, 6
        optional :float, :float, 7
        optional :bool, :bool, 8
      end
    end
    add_message "tensors.Module" do
      optional :name, :string, 1
      repeated :names, :string, 2
      repeated :attributes, :message, 3, "tensors.Attribute"
    end
    add_enum "tensors.Dtype" do
      value :DT_INVALID, 0
      value :DT_FLOAT32, 1
      value :DT_FLOAT64, 2
      value :DT_FLOAT16, 3
      value :DT_BFLOAT16, 4
      value :DT_COMPLEX32, 5
      value :DT_COMPLEX64, 6
      value :DT_COMPLEX128, 7
      value :DT_UINT8, 8
      value :DT_INT8, 9
      value :DT_INT16, 10
      value :DT_INT32, 11
      value :DT_INT64, 12
      value :DT_BOOL, 13
      value :DT_QUINT8, 14
      value :DT_QINT8, 15
      value :DT_QINT32, 16
      value :DT_QUINT4_2, 17
    end
    add_enum "tensors.AttributeType" do
      value :AT_PARAMETER, 0
      value :AT_BUFFER, 1
    end
  end
end

module Tensors
  Tensor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Tensor").msgclass
  Attribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Attribute").msgclass
  Module = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Module").msgclass
  Dtype = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Dtype").enummodule
  AttributeType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.AttributeType").enummodule
end