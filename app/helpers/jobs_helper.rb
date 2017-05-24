module JobsHelper
  def job_card_background_path(job)
    cl_image_path(job.image.path, {
      gravity: "xy_center",
      height: 370,
      width: 440,
      x: 280,
      y: 327,
      crop: :crop,
    })
  end
end
