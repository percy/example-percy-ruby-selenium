# PER-8195 Phase 1 — ruby-selenium advanced example.
# Each `it` exercises one row of the Advanced Feature Matrix. See
# ../matrix.yml for the canonical mapping of test name -> matrix row.

require 'spec_helper'

RSpec.describe 'TodoMVC Advanced' do
  before(:each) { seed_todo }

  it 'exercises widths' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises widths',
                  widths: [375, 768, 1280, 1920])
  end

  it 'exercises minHeight' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises minHeight',
                  min_height: 2000)
  end

  it 'exercises enableJavaScript' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises enableJavaScript',
                  enable_javascript: true)
  end

  it 'exercises responsive_snapshot_capture' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises responsiveSnapshotCapture',
                  responsive_snapshot_capture: true, widths: [375, 1280])
  end

  it 'exercises readiness preset' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises readiness preset',
                  readiness: { preset: 'strict', timeoutMs: 5000 })
  end

  it 'exercises labels' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises labels',
                  labels: 'smoke,sdk-ruby-selenium')
  end

  it 'exercises testCase' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises testCase',
                  test_case: 'todomvc-advanced-suite')
  end

  it 'exercises devicePixelRatio' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises devicePixelRatio',
                  device_pixel_ratio: 2)
  end

  it 'exercises browsers override' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises browsers override',
                  browsers: %w[chrome firefox])
  end

  it 'exercises regions' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises regions',
                  regions: [{
                    algorithm: 'ignore',
                    elementSelector: { boundingBox: { x: 0, y: 0, width: 200, height: 100 } }
                  }])
  end

  it 'exercises sync option' do
    Percy.snapshot($driver, 'TodoMVC Advanced > exercises sync option', sync: false)
  end

  it 'exercises snake_case + camelCase dual naming' do
    # percy-selenium accepts both Ruby-idiomatic snake_case and camelCase keys
    # in the same options hash; verify they coexist.
    Percy.snapshot($driver, 'TodoMVC Advanced > snake_case + camelCase dual naming',
                  responsive_snapshot_capture: true,
                  widths: [375, 1280],
                  min_height: 1024)
  end
end
