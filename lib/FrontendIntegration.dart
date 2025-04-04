import 'package:flutter/material.dart';
import 'package:flutter_template/commen_fields.dart';
import 'package:get/get.dart';

class FrontendIntegration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Common Methods Integration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => pickImage(isMultiple: false),
              child: const Text('Pick Single Image'),
            ),
            Obx(() {
              if (singleImage.value != null) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        singleImage.value!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 20),
                        onPressed: removeSingleImage,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                          padding: const EdgeInsets.all(4),
                          shape: const CircleBorder(),
                        ),
                        tooltip: 'Remove Image',
                      ),
                    ),
                  ],
                );
              } else {
                return const Text('No image selected');
              }
            }),
            ElevatedButton(
              onPressed: () => pickImage(isMultiple: true),
              child: const Text('Pick Multiple Images'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (multipleImages.isEmpty) {
                return const Text('No images selected');
              } else {
                return Expanded(
                  child: GridView.builder(
                    itemCount: multipleImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final image = multipleImages[index];
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.white, size: 20),
                              onPressed: () => removeMultipleImage(image),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black54,
                                padding: const EdgeInsets.all(4),
                                shape: const CircleBorder(),
                              ),
                              tooltip: 'Remove Image',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
            ElevatedButton(
              onPressed: () => pickFiles(isMultiple: false),
              child: const Text('Pick Single File'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final file = selectedFile.value;
              if (file == null) {
                return const Text('No file selected');
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        file.path.split('/').last,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: clearFiles,
                      icon: const Icon(Icons.close, color: Colors.red),
                      tooltip: 'Remove File',
                    ),
                  ],
                );
              }
            }),
            ElevatedButton(
              onPressed: () => pickFiles(isMultiple: true),
              child: const Text('Pick Multiple Files'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (selectedFiles.isEmpty) {
                return const Text('No files selected');
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemCount: selectedFiles.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final file = selectedFiles[index];
                      return ListTile(
                        title: Text(
                          file.path.split('/').last,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          tooltip: 'Remove File',
                          onPressed: () => removeFile(file),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
            if (selectedFiles.isNotEmpty)
              ElevatedButton.icon(
                onPressed: clearFiles,
                icon: const Icon(Icons.delete_sweep),
                label: const Text('Clear All Files'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),

            /// DATE PICKER
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final date = selectedDate.value;
                    return Text(
                      date != null
                          ? 'Selected Date: ${date.toLocal().toString().split(' ')[0]}'
                          : 'No date selected',
                    );
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => pickDate(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// TIME PICKER
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final time = selectedTime.value;
                    return Text(
                      time != null
                          ? 'Selected Time: ${time.format(context)}'
                          : 'No time selected',
                    );
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => pickTime(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
