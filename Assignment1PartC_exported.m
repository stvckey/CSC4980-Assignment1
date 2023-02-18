classdef Assignment1PartC_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        MonoStreamButton  matlab.ui.control.Button
        UIAxes            matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: MonoStreamButton
        function MonoStreamButtonPushed(app, event)
            cam = webcam;
            frame = snapshot(cam);
            im = image(app.UIAxes, zeros(size(frame),'uint8'));
            axis(app.UIAxes, 'image');

            preview(cam,im);
            pause;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [87 36 467 371];

            % Create MonoStreamButton
            app.MonoStreamButton = uibutton(app.UIFigure, 'push');
            app.MonoStreamButton.ButtonPushedFcn = createCallbackFcn(app, @MonoStreamButtonPushed, true);
            app.MonoStreamButton.Position = [271 441 100 23];
            app.MonoStreamButton.Text = 'Mono Stream';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Assignment1PartC_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end