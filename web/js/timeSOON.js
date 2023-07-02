

  var duration = '${detail.duration}'; // Assuming the format is HH:mm:ss

            var durationParts = duration.split(":");
            var hours = parseInt(durationParts[0], 10);
            var minutes = parseInt(durationParts[1], 10);
            var seconds = parseInt(durationParts[2], 10);

            hours += 2;

            if (hours > 23) {
                hours -= 24;
            }

            var soonDuration = hours.toString().padStart(2, "0") + ":" + minutes.toString().padStart(2, "0") + ":" + seconds.toString().padStart(2, "0");

            document.getElementById("formtitle").value = '${detail.date} - from ' + duration + ' to ' + soonDuration ;