module JobsHelper
  def job_card_background_path(job)
    cl_image_path(job.image.path, {
      gravity: "xy_center",
      height: 370,
      width: 440,
      x: 260,
      y:440,
      crop: :crop,
    })
  end
end
