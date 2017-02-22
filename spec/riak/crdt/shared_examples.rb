# Copyright 2010-present Basho Technologies, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

shared_examples_for "Map CRDT" do
  let(:typed_collection){ Riak::Crdt::TypedCollection }

  it 'contains counters' do
    expect(subject).to respond_to(:counters)
    expect(subject.counters).to be_an_instance_of typed_collection
  end

  it 'contains flags' do
    expect(subject).to respond_to(:flags)
    expect(subject.counters).to be_an_instance_of typed_collection
  end

  it 'contains maps' do
    expect(subject).to respond_to(:maps)
    expect(subject.counters).to be_an_instance_of typed_collection
  end

  it 'contains registers' do
    expect(subject).to respond_to(:registers)
    expect(subject.counters).to be_an_instance_of typed_collection
  end

  it 'contains sets' do
    expect(subject).to respond_to(:sets)
    expect(subject.counters).to be_an_instance_of typed_collection
  end

  it 'accepts operations' do
    expect(subject).to respond_to(:operate)
  end
end

shared_examples_for "Counter CRDT" do
  it 'has a value' do
    expect(subject).to respond_to :value
  end

  it 'has an increment method' do
    expect(subject).to respond_to :increment
  end

  it 'has a decrement method' do
    expect(subject).to respond_to :decrement
  end

  it 'has a batch method' do
    expect(subject).to respond_to :batch
  end
end

shared_examples_for 'Set CRDT' do
  it 'has a value' do
    expect(subject).to respond_to :value
    expect(subject).to respond_to :members
    expect(subject).to respond_to :to_a
  end

  it 'has an include? method' do
    expect(subject).to respond_to :include?
  end

  it 'has an empty? method' do
    expect(subject).to respond_to :empty?
  end

  it 'has an add method' do
    expect(subject).to respond_to :add
  end

  it 'has a remove method' do
    expect(subject).to respond_to :remove
  end
end

shared_examples_for 'Grow Only Set CRDT' do
  it 'has a value' do
    expect(subject).to respond_to :value
    expect(subject).to respond_to :members
    expect(subject).to respond_to :to_a
  end

  it 'has an include? method' do
    expect(subject).to respond_to :include?
  end

  it 'has an empty? method' do
    expect(subject).to respond_to :empty?
  end

  it 'has an add method' do
    expect(subject).to respond_to :add
  end
end

shared_examples_for 'HyperLogLog CRDT' do
  it 'has a value' do
    expect(subject).to respond_to :value
  end

  it 'has a cardinality' do
    expect(subject).to respond_to :cardinality
  end

  it 'has an add method' do
    expect(subject).to respond_to :add
  end
end
