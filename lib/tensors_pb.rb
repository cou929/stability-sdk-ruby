# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tensors.proto

require 'google/protobuf'


descriptor_data = "\n\rtensors.proto\x12\x07tensors\"\x82\x01\n\x06Tensor\x12\x1d\n\x05\x64type\x18\x01 \x01(\x0e\x32\x0e.tensors.Dtype\x12\r\n\x05shape\x18\x02 \x03(\x03\x12\x0c\n\x04\x64\x61ta\x18\x03 \x01(\x0c\x12.\n\tattr_type\x18\x04 \x01(\x0e\x32\x16.tensors.AttributeTypeH\x00\x88\x01\x01\x42\x0c\n\n_attr_type\"\xac\x01\n\tAttribute\x12\x0c\n\x04name\x18\x01 \x01(\t\x12!\n\x06module\x18\x03 \x01(\x0b\x32\x0f.tensors.ModuleH\x00\x12!\n\x06tensor\x18\x04 \x01(\x0b\x32\x0f.tensors.TensorH\x00\x12\x10\n\x06string\x18\x05 \x01(\tH\x00\x12\x0f\n\x05int64\x18\x06 \x01(\x03H\x00\x12\x0f\n\x05\x66loat\x18\x07 \x01(\x02H\x00\x12\x0e\n\x04\x62ool\x18\x08 \x01(\x08H\x00\x42\x07\n\x05value\"M\n\x06Module\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\r\n\x05names\x18\x02 \x03(\t\x12&\n\nattributes\x18\x03 \x03(\x0b\x32\x12.tensors.Attribute*\x9e\x02\n\x05\x44type\x12\x0e\n\nDT_INVALID\x10\x00\x12\x0e\n\nDT_FLOAT32\x10\x01\x12\x0e\n\nDT_FLOAT64\x10\x02\x12\x0e\n\nDT_FLOAT16\x10\x03\x12\x0f\n\x0b\x44T_BFLOAT16\x10\x04\x12\x10\n\x0c\x44T_COMPLEX32\x10\x05\x12\x10\n\x0c\x44T_COMPLEX64\x10\x06\x12\x11\n\rDT_COMPLEX128\x10\x07\x12\x0c\n\x08\x44T_UINT8\x10\x08\x12\x0b\n\x07\x44T_INT8\x10\t\x12\x0c\n\x08\x44T_INT16\x10\n\x12\x0c\n\x08\x44T_INT32\x10\x0b\x12\x0c\n\x08\x44T_INT64\x10\x0c\x12\x0b\n\x07\x44T_BOOL\x10\r\x12\r\n\tDT_QUINT8\x10\x0e\x12\x0c\n\x08\x44T_QINT8\x10\x0f\x12\r\n\tDT_QINT32\x10\x10\x12\x0f\n\x0b\x44T_QUINT4_2\x10\x11*0\n\rAttributeType\x12\x10\n\x0c\x41T_PARAMETER\x10\x00\x12\r\n\tAT_BUFFER\x10\x01\x42)Z\'github.com/coreweave/tensorizer/tensorsb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Tensors
  Tensor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Tensor").msgclass
  Attribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Attribute").msgclass
  Module = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Module").msgclass
  Dtype = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.Dtype").enummodule
  AttributeType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tensors.AttributeType").enummodule
end
